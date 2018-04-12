import datetime


cabin_list = {
	1:'Mason',
	2:'Yale',
	3:'Lang',
	4:'Trinity',
	5:'Cargill',
	6:'Penn',
	7:'Bowdoin',
	8:'Columbia',
	9:'Amhearst',
	10:'Princeton',
	11:'Otyokwa',
	12:'Wesleyan',
	13:'Harvard',
	14:'Springfield',
	15:'Bates',
	16:'Colby',
	17:'Dartmouth',
	18:'Williams',
	19:'Cornell',
	20:'Brown',
	21:'Outpost',
	22:'Accomack',
	'S1':'#Esty House',
	'S2':'#Calloway House',
	'S3':'#Infirmary',
	'S4':'#Tall Pines',
	'S5':'#Help House',
	'S6':'#Campbell House',
	'S7':'#Clausen House'
}

class Season:
	def __init__(self, year, half):
		self.year = year
		self.half = half


class Cabin(dict):
	def __init__(self):
		self.name = None
		self.campus = None
		self.max_campers = 10
		self.min_campers = 0
		self.max_staff = 3
		self.min_staff = 0
		self.age_rank = None

	def set_name(self, name):
		self.name = name

	def set_campus(self, campus):
		self.campus = campus

	def set_age_rank(self, rank):
		self.age_rank = rank

	def __repr__(self):
		return str(self.age_rank).zfill(2)+": "+self.name


class CabinSeason(Season):
	def __init__(self, year, half, cabin):
		self.year = year
		self.half = half
		self.cabin = cabin

	def set_year(self, year):
		self.year = year

	def set_cabin(self, cabin):
		self.cabin = cabin

	def set_half(self, half):
		self.half = half

	def __repr__(self):
		return str({'year':self.year, 'half':self.half, 'cabin':self.cabin})


class Person(dict):
	def __init__(self, fname, lname, mname=''):
		self['fname'] = fname
		self['lname'] = lname
		self['mname'] = mname
		self['dob'] = None
		self['title'] = None
		self['address'] = {}
		self['cabins'] = []
		self['team'] = None
		self['tribe'] = None
		self['donations'] = []
		self['leadership'] = []

	def set_dob(self, dob):
		assert isinstance(dob, datetime.datetime)
		self['dob'] = dob

	def add_season(self, season):
		assert isinstance(season, CabinSeason)
		self['cabins'].append(season)

	def set_team(self, team):
		self['team'] = team

	def set_tribe(self, tribe):
		self['tribe'] = tribe

	def set_title(self, title):
		self['title'] = title

	def update_address(self, d):
		self['address']['street'] = d['street']
		self['address']['city'] = d['city']
		self['address']['state'] = d['state']
		self['address']['postal_code'] = d['postal_code']
		self['address']['country'] = d['country']
		self['address']['last_update'] = datetime.datetime.now()

	def add_donation(self, amount, date, purpose):
		self['donations'].append({'amount':amount, 'date':date, 'pourpose':purpose})







class PersonSeason(dict):
	def __init__(self, person, year):
		self.person = person
		self.year = year
		self.arrive = None
		self.depart = None
		self.first = True
		self.second = True
		self.absences = []
		self.certifications = []
		self.teams_participated = []
		self.leadership = []
		self.medical = {}
		self.cabins = []

	def set_cabin(self, cabin):
		assert isinstance(cabin, Cabin)

class CabinSeason(dict):
	def __init__(self, cabin, year):
		self.cabin = cabin
		self.year = year
		self.campers = []
		self.staff = []

	def add(self, person, role):
		assert isinstance(person, Person)
		self.campers.append((person,role))


class Activity(dict):
	staff
	campers
	name


class Period(dict):
	def __init__(self):
		self.date = None
		self.label = None
		self.start = None
		self.end = None
		self.activities = []
		self.on_duty = {}

	def set_label(self, label):
		self.label = label

	def set_start(self, start_time):
		assert isinstance(start_time, datetime.datetime)
		self.start = start_time

	def set_end(self, end_time):
		self.end = end_time

	def set_on_duty(self, d):
		assert isinstance(d, dict)
		self.on_duty = d

	def add_activities(self, activities):

		self.activities += activities



	def __init__(self):
		self.name = None
		self.dob = None
		self.title = None
		self.certifications = []

	def set_name(self, name):
		self.name = name

	def set_dob(self, dob):
		self.dob = dob

	def set_title(self, title):
		self.title = title

	def add_certification(self, certification):
		if isinstance(certification, Certification):
			self.certifications.append(certification)

	def add_season(self, staff_season)
		self.campus = None
		self.cabin = None
		self.sr_staff_role = None
		self.activity_roles = []
		self.planned_absences = []

	def set_campus(self, campus):
		self.campus = campus

	def set_cabin(self, cabin):
		assert cabin in cabin_list
		self.cabin = cabin

	def set_sr_staff_role(self, role):
		self.sr_staff_role = role

	def add_activity_role(self, activity_role):
		if isinstance(activity_role, ActivityRole):
			self.activity_roles.append(activity_role)



	def add_planned_absence(self, absence):
		if isinstance(absence, Absence):
			self.planned_absences.append(absence)


class ActivityRole:
	def __init__(self, activity, role, weight = None):
		self.activity = activity
		self.role = role
		self.weight = weight

	def update_role(self, new_role=None, new_weight=None):
		if new_role:
			self.role = new_role
		if new_weight:
			self.weight = new_weight


class Certification:
	def __init__(self, name, body, number, issue_date, expiration):
		self.name = name
		self.body = body
		self.number = number
		self.issue_date = issue_date
		self.expiration = expiration


class Absence:
	def __init__(self, start_date, end_date, reason = None, location = None):
		self.start_date = start_date
		self.end_date = end_date
		self.reason = reason
		self.location = location


class Duty(dict):
	def __init__(self, MOD=None, LOD=None, CQ=None, nurse=None, COD=None, LG=None):
		self['MOD'] = MOD
		self['LOD'] = LOD
		self['CQ'] = CQ
		self['nurse'] = nurse
		self['COD'] = COD
		self['LG'] = LG




class Activity(dict):
	def __init__(self):
		self['name'] = None
		self['max_campers'] = 130
		self['director'] = None
		self['leads'] = []
		self['support'] = []
		self['coaches'] = []
		self['min_staffing'] = 1
		self['staff_certification_requirements'] = []
		self['camper_certification_requirements'] = []
		self['min_cabin'] = 'Mason'

	def set_name(self, name):
		self['name'] = name

	def set_max_campers(self, integer):
		self['max_campers'] = integer

	def set_director(self, staff_member):
		if isinstance(staff_member, StaffMember):
			self['director'] = staff_member
		else:
			Exception("staff_member argument not class StaffMember.")

	def add_lead(self, staff_member):
		self['leads'] += staff_member

	def add_support(self, staff_member):
		self['support'] += staff_member

	def add_coach(self, staff_member):
		self['coaches'] += staff_member

	def set_min_staffing(self, integer):
		self['min_staffing'] = integer

	def add_staff_cert_req(self, certification):
		self['staff_certification_requirements'].append(certification)

	def add_camper_cert_req(self, certification):
		self['camper_certification_requirements'].append(certification)

	def set_min_cabin(self, cabin_name):
		assert cabin_name in cabin_list
		self['min_cabin'] = 'Mason'
