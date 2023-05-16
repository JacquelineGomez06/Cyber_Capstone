{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "\n",
    "import psycopg2\n",
    "import psycopg2.extras\n",
    "from config import connection\n",
    "import csv\n",
    "import os\n",
    "\n",
    "# ** --> dictionary unpacking!\n",
    "conn = psycopg2.connect(**connection)\n",
    "\n",
    "\n",
    "with conn.cursor() as cursor:\n",
    "    # READ FILES IN PYTHON\n",
    "    with open('sql/schema.sql', 'r') as schema:\n",
    "        # read --> reads in entire file\n",
    "        queries = schema.read()\n",
    "        print(queries)\n",
    "        # we are starting a transaction (or continuing)\n",
    "        cursor.execute(queries)\n",
    "    # commit your changes\n",
    "    conn.commit()"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "name": "python",
   "version": "3.10.7"
  },
  "orig_nbformat": 4,
  "vscode": {
   "interpreter": {
    "hash": "a20acef5fce1a6e8151891996d23ff986d4c9a9b369454443776246f5d30d362"
   }
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
