import React, { useState } from 'react';
import styled from 'styled-components';
import { useItemDetailContext } from '../../contexts/ItemDetailContext';
import { Link } from 'react-router-dom';

const ItemDetail = styled((props) => {
  const { className } = props;
  const { item, components, refetch } = useItemDetailContext();
  const [componentDetail, setComponentDetail] = useState();
  const createItemComponent = async() => {
    await fetch(`http://localhost:3000/v1/item_components?item_id=${item.id}&name=New Component&description=A brand new item`, {method: 'post'});
    refetch();
  }

  const deleteItemComponent = async(id) => {
    await fetch(`http://localhost:3000/v1/item_components/${id}`, {method: 'delete'});
    setComponentDetail();
    refetch();
  }

  return(
    <div className={className}>
      <div style={{width: '65%'}}>
        <div style={{textAlign: 'left'}}>
          <Link to='/items'>{'<-'} All Items</Link>
        </div>
        <h1>{item?.name}</h1>
        <div className='component-container'>
          <div className='add-new' onClick={() => createItemComponent()}>+ Add New</div>
          {components?.map(component => {
            return (
              <div className='component-card' onClick={() => setComponentDetail(component)}>
                <div>{component.name}</div>
              </div>
            );
          })}
        </div>
        {componentDetail &&
          <div style={{border: '3px solid pink', margin: '20px'}}>
            <div style={{cursor: 'pointer'}} onClick={() => deleteItemComponent(componentDetail.id)}>Delete</div>
            <h2>{componentDetail.name}</h2>
            <div>{componentDetail.description}</div>
          </div>
        }
      </div>
      <div className='actions-container'>
        <div className='actions-menu'>
          <div style={{backgroundColor: 'white'}}>Urgent Actions</div>
          <div>Incoming Components</div>
          <div>Sales</div>
          <div>Statistics</div>
        </div>
      </div>
    </div>
  )
})`
  width: 100%;
  padding: 50px;
  display: flex;
  box-sizing: border-box;

  .component-container {
    width: 500px;
    display: flex;
    flex-wrap: nowrap;
    gap: 50px;
    box-sizing: border-box;
    overflow-x: auto;
    margin: auto;

    .add-new {
      background-color: white;
      border: 3px solid pink;
      padding: 25px;
      border-radius: 5px;
      cursor: pointer;
    }

    .component-card {
      background-color: pink;
      padding: 25px;
      border-radius: 5px;
      display: flex;
      align-items: center;
      cursor: pointer;
    }
  }

  .actions-container {
    margin: 50px 0; 
    border: 3px solid pink; 
    width: 35%;
    border-radius: 5px;

    .actions-menu {
      width: 100%;
      display: flex;
      box-sizing: border-box;
      background-color: pink;

      > * {
        background-color: pink;
        padding: 10px;
        flex: 0 0 1;
        border-top-right-radius: 5px;
      }
    }
  }
`;

export default ItemDetail;
