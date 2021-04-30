#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
from time import time

class Battery():

    def __init__(self, dir_path, name):
        self.mode = 'q'
        self.name = name
        self.dir_path = dir_path
        self._check_files_exist_and_readable()
        self.update_all()

    def _print(self, *args, **kwargs):
            if self.mode == 'q':
                pass
            else:
                print(*args, **kwargs)

    def _check_files_exist_and_readable(self):
        self._print('###################################################')
        self._print(f'checking {self.name} file ... ' , end='')
        used_file_list = [ 'technology', 'serial_number',
                'power_now', 'present', 'manufacturer', 'energy_now',
                'type', 'capacity', 'cycle_count', 'voltage_now',
                'status','alarm', 'model_name', 'voltage_min_design',
                'capacity_level', 'energy_full_design', 'energy_full'
                ]
        dir_list = os.listdir(self.dir_path)
        if set(used_file_list).issubset(dir_list):
            for file_ in used_file_list:
                file_ = os.path.join(self.dir_path, file_)
                if not os.access(file_, os.R_OK):
                    self._print("Something went wrong with file/dir", file_)
        else:
            # need system check
            self._print(used_file_list)
            self._print('####')
            self._print(dir_list)

        # alarm
        # power_now
        # type
        self._print('all files are okay!')
        self._print('###################################################')

    def _read_info_file(self, info_files):
        for info in info_files:
            info_file = os.path.join(self.dir_path, info)
            with open(info_file, 'r') as myfile:
                    info_files[info]=myfile.read().replace('\n', '')
    
    def _print_info(self, info_dict):
        for key, value in info_dict.items():
            self._print('\t{}: {}'.format( key, value))


    def get_model_info(self):
        self._print('getting model info ...')
        model_info = {
                'serial_number': '',
                'model_name': '',
                'technology': '',
                'manufacturer': ''}

        self._read_info_file(model_info)
        self._print_info(model_info)
        self.model_info = model_info

    def get_voltage_info(self):
        self._print('getting voltage info ...')
        voltage_info = {
                'voltage_now': '',
                'voltage_min_design': ''}

        self._read_info_file(voltage_info)
        self._print_info(voltage_info)
        self.voltage_info = voltage_info


    def get_status(self):
        self._print('getting status info ...')
        valid_status = ('Full', 'full', 'unknown', 'Unknown',
                'charging', 'Charging', 'discharging', 'Discharging')
        status_info = {
                'status': '' }

        self._read_info_file(status_info)
        self._print_info(status_info)
        self.status_info = status_info


    def get_persentage(self):
        self._print('getting capacity info ...')
        capacity_info = {
                'capacity_level': '',
                'capacity': '', }

        self._read_info_file(capacity_info)
        self._print_info(capacity_info)
        self.capacity_info = capacity_info

    def get_power_info(self):
        self._print('getting power info ...')
        power_info = {
                'alarm': '',
                'energy_now': '',
                'energy_full': '',
                'energy_full_design': '',
                'power_now': '', }

        self._read_info_file(power_info)
        self._print_info(power_info)
        self.power_info = power_info


    def calculate_time_remaining(self):
        # power now
        # power now 
        # or use log file
        pass


    def update_main(self):
        self.get_status()
        self.get_power_info()
        self.get_persentage()
        self.calculate_time_remaining()

    def update_all(self):
        self.get_model_info()
        self.get_voltage_info()
        self.get_status()
        self.get_persentage()
        self.get_power_info()
        self.calculate_time_remaining()

    def all_info(self):
        info = {
                "name": self.name,
                "time": time(),
                "model" : self.model_info,
                "voltage": self.voltage_info,
                "status": self.status_info,
                "capacity": self.capacity_info,
                "power": self.power_info,
                }
        return info



try:
    BAT = []
    for i in range(3):
        BAT.append(Battery(f'/sys/class/power_supply/BAT{i}', f'BAT{i}'))
except:
    pass

for b in BAT:
    print(b.all_info())
