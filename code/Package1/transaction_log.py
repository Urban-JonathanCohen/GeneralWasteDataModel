#!/usr/bin/python
#-*- coding: utf-8 -*-

class transaction_log:
    def __init__(self):
        self.transaction_id = None
        self.buyer_id = None
        self.seller_id = None
        self.time_stamp = None
        self.price = None
        self.currency = None
        self.amount = None
        self.amount_unit = None

