# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

am = VehicleCategory.create!(name: 'АМ', description: 'мопеды');
a  = VehicleCategory.create!(name:'A', description: 'мотоциклы');
a1 = VehicleCategory.create!(name:'A1', description: 'мотоциклы с рабочим объемом двигателя, не превышающим 125 кубических сантиметров, и максимальной мощностью, не превышающей 11 киловатт (легкие мотоциклы)');
b  = VehicleCategory.create!(name:'B', description: 'автомобили, технически допустимая общая масса которых не превышает 3500 килограммов и число мест для сидения которых, помимо сиденья водителя, не превышает восьми; автомобиль категории «B», сцепленный с прицепом, технически допустимая общая масса которого не превышает 750 килограммов; автомобиль категории «B», сцепленный с прицепом, технически допустимая общая масса которого превышает 750 килограммов, но не превышает массы автомобиля без нагрузки, а технически допустимая общая масса автомобиля и прицепа, образующих состав, суммарно не превышает 3500 килограммов');
c  = VehicleCategory.create!(name:'C', description: 'автомобили, за исключением относящихся к категории «D», технически допустимая общая масса которых превышает 3500 килограммов; автомобиль категории «C», сцепленный с прицепом, технически допустимая общая масса которого не превышает 750 килограммов');
d  = VehicleCategory.create!(name:'D', description: 'автомобили, предназначенные для перевозки пассажиров и имеющие более восьми мест для сидения, помимо сиденья водителя; автомобиль категории «D», сцепленный с прицепом, технически допустимая общая масса которого не превышает 750 килограммов');
f  = VehicleCategory.create!(name:'F', description: 'трамваи');
i  = VehicleCategory.create!(name:'I', description: 'троллейбусы');

VehicleColor.create!(name: 'Красный');
VehicleColor.create!(name: 'Оранжевый');
VehicleColor.create!(name: 'Желтый');
VehicleColor.create!(name: 'Зеленый');
VehicleColor.create!(name: 'Голубой');
VehicleColor.create!(name: 'Синий');
VehicleColor.create!(name: 'Фиолетовый');

VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW 1');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW 2');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW 3');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW 3 Gran Turismo');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW 4');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW 5');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW 5 Gran Turismo');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW 6');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW 6 Gran Coupe');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW 7');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW 8');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW M Coupe');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW M3');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW M5');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW M6');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW X1');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW X3');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW X4');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW X5');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW X5 M');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW X6');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW X6 M');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW Z3');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW Z4');
VehicleModel.create!(vehicle_category_id: b.id, name: 'BMW Z4 M');
