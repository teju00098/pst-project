json.extract! master, :id, :CountName, :StoreCode, :StoreName, :VenderCode, :VenderName, :DeptCode, :DeptName, :SubDeptCode, :SubDeptName, :Class, :ClassName, :SubClass, :SubClassName, :SKUType, :SpecialAttribute, :SKU, :BarcodeIBC, :BarcodeSBC, :ProductName, :Brand, :Model, :UnitOfMeasure, :Stock, :PackSize, :Cost, :RetailPrice, :Status, :created_at, :updated_at
json.url master_url(master, format: :json)