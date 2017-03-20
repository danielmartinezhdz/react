@Record = React.createClass
	handleDelete: (e) ->
		e.preventDefault()
		$.ajax
			method: 'DELETE'
			url: '/records/#{@props.record.id}'
			dataType: 'JSON'
			success: () =>
				@props.handleDeleteRecord @props.record
	deleteRecord: (record) ->
		records = @state.records.slice()
		index = records.indexOf record
		records.splice index, 1
		@replaceState records: records
	render: ->
		React.DOM.tr null,
			React.DOM.td null, @props.record.date
			React.DOM.td null, @props.record.title
			React.DOM.td null, amountFormat(@props.record.amount)
			React.DOM.td null,
				React.DOM.a
					className: 'btn btn-danger'
					'Delete'
