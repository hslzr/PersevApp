# First account
demo_account = Account.first_or_create(
  name: 'SampleAccount'
)

# First group
demo_group = demo_account.create_group(
  number: 666,
  name: 'Cowboys from Hell'
)

# First group sections
demo_group.sections.create(name: 'Manada')
demo_group.sections.create(name: 'Tropa')
demo_group.sections.create(name: 'Caminantes')
demo_group.sections.create(name: 'Clan')
demo_group.sections.create(name: 'Dirigentes')

# Admin user
admin_user = User.first_or_create(
  name: 'Admin',
  last_name: 'User',
  sur_name: 'Demo',
  email: 'admin@example.com',
  group_id: demo_group.id,
  account_id: demo_account.id,
  password: 'demodemo',
  password_confirmation: 'demodemo')
