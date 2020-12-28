# myRetail

These instructions will get you a copy of the myRetail API up and running on your local machine for development and testing purposes.

## Ruby and Rails Versions:
* Ruby version 2.5.3
* Rails 6.0.3

## Installation
1. Clone this repository
```bash
git clone git@github.com:Mgitim/myRetail.git
```
2. Go into myRetail folder and checkout develop branch
```bash
cd myRetail
git checkout develop
```
3. Run bundle
```bash
bundle install
```
4. Start mongo db local instance
```bash
mongod --dbpath ~/data/db
```
5. Populate mongodb with seed price data for the example Products
```bash
rails db:seed
```
6. Once the previous step is successfully completed start the server.
```bash
rails s
```
## License
[MIT](https://choosealicense.com/licenses/mit/)
