## "Book Shelf" API Documentation

https://martinsbookshelf.herokuapp.com/


### Getting Access

This API is invite only.

Upon the creation of your account you will be given an API key.

### Authentication

Each API request needs to contain the following two authentication headers: `X-User-Token` and `X-User-Email`.

`X-User-Token` must be set to the API key on your dashboard.

`X-User-Email` must be set to the email address of your account.

### Endpoints

#### `GET /api/books`

Unauthenticated. Returns all books.

Response:

```
[
  {
    id: number
    title: string
    created_at: string
  }
]
```

-----

#### `GET /api/book_stocks`

Returns all of your book stocks of your book store.

Response:

```
[
  {
    id: number
    stock_level: number
    in_stock: boolean
    created_at: string
    book: {
      id: number
      title: string
    }
  }
]
```

-----

#### `POST /api/book_stocks`

Create a new book stock

Body:

```
{
  book_stock: {
    book_id: number
    stock_level: number
    in_stock: boolean
  }
}
```

Response

```
{
  id: number
  stock_level: number
  in_stock: boolean
  create_at: string
  book: {
    id: number
    title: string
  }
}
```

-----

#### `PATCH /api/book_stocks/:id`

Updates a given book stock

Body:

```
{
  book_stock: {
    book_id: number
    stock_level: number
    in_stock: boolean
  }
}
```

Response

```
{
  id: number
  stock_level: number
  in_stock: boolean
  create_at: string
  book: {
    id: number
    title: string
  }
}
```

-----

#### `DELETE /api/book_stocks/:id`

Deletes a given book stock

Body: none

Response:

```
{
  message: "success"
}
```
