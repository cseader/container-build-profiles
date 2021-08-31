#!/bin/bash
set -e

zypper -n --gpg-auto-import-keys ref

zypper in -y aaa_base aaa_base-extras net-tools timezone vim less sudo tar python python-xml apache2 apache2-prefork