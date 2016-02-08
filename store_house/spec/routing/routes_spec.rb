require 'spec_helper'

describe 'routes for Business Data Controller' do
  it 'routes /business_data#index' do
    expect(get('/business_data')).to route_to('business_data#index')
  end

  it 'routes /business_data#create' do
    expect(post('/business_data')).to route_to('business_data#create')
  end

  it 'routes /business_data#new' do
    expect(get('/business_data/new')).to route_to('business_data#new')
  end
  it 'routes /business_data#show' do
    expect(get('/business_data/12')).to route_to(:controller => 'business_data', :action => 'show', :id => '12')
  end
  it 'routes /business_data#update' do
    expect(put('/business_data/1')).to route_to(:controller => 'business_data', :action => 'update', :id => '1')
  end
end

describe 'routes for Articles Controller' do
  it 'routes /articles#index' do
    expect(get('/articles')).to route_to('articles#index')
  end

  it 'routes /articles#create' do
    expect(post('/articles')).to route_to('articles#create')
  end

  it 'routes /articles#new' do
    expect(get('/articles/new')).to route_to('articles#new')
  end
  it 'routes /articles#show' do
    expect(get('/articles/12')).to route_to(:controller => 'articles', :action => 'show', :id => '12')
  end
  it 'routes /articles#update' do
    expect(put('/articles/1')).to route_to(:controller => 'articles', :action => 'update', :id => '1')
  end
end
describe 'routes for Contacts Controller' do
  it 'routes /contacts#index' do
    expect(get('/contacts')).to route_to('contacts#index')
  end

  it 'routes /contacts#create' do
    expect(post('/contacts')).to route_to('contacts#create')
  end

  it 'routes /contacts#new' do
    expect(get('/contacts/new')).to route_to('contacts#new')
  end
  it 'routes /contacts#show' do
    expect(get('/contacts/12')).to route_to(:controller => 'contacts', :action => 'show', :id => '12')
  end
  it 'routes /contacts#update' do
    expect(put('/contacts/1')).to route_to(:controller => 'contacts', :action => 'update', :id => '1')
  end
end
describe 'routes for Costs Controller' do
  it 'routes /costs#index' do
    expect(get('/costs')).to route_to('costs#index')
  end

  it 'routes /costs#create' do
    expect(post('/costs')).to route_to('costs#create')
  end

  it 'routes /costs#new' do
    expect(get('/costs/new')).to route_to('costs#new')
  end
  it 'routes /costs#show' do
    expect(get('/costs/12')).to route_to(:controller => 'costs', :action => 'show', :id => '12')
  end
  it 'routes /costs#update' do
    expect(put('/costs/1')).to route_to(:controller => 'costs', :action => 'update', :id => '1')
  end
end
describe 'routes for Orders Controller' do
  it 'routes /orders#index' do
    expect(get('/orders')).to route_to('orders#index')
  end

  it 'routes /orders#create' do
    expect(post('/orders')).to route_to('orders#create')
  end

  it 'routes /orders#new' do
    expect(get('/orders/new')).to route_to('orders#new')
  end
  it 'routes /orders#show' do
    expect(get('/orders/12')).to route_to(:controller => 'orders', :action => 'show', :id => '12')
  end
  it 'routes /orders#update' do
    expect(put('/orders/1')).to route_to(:controller => 'orders', :action => 'update', :id => '1')
  end
end

describe 'routes for Stocks Controller' do
  it 'routes /stocks#index' do
    expect(get('/stocks')).to route_to('stocks#index')
  end

  it 'routes /orders#create' do
    expect(post('/stocks')).to route_to('stocks#create')
  end

  it 'routes /stocks#new' do
    expect(get('/stocks/new')).to route_to('stocks#new')
  end
  it 'routes /stocks#show' do
    expect(get('/stocks/12')).to route_to(:controller => 'stocks', :action => 'show', :id => '12')
  end
  it 'routes /stocks#update' do
    expect(put('/stocks/1')).to route_to(:controller => 'stocks', :action => 'update', :id => '1')
  end
end
