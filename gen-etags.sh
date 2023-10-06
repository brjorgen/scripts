#!/bin/bash
find . -name "*.[c^h]" -print | xargs etags --append
