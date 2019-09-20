import Link from 'next/link'
import PropTypes from 'prop-types'

import Page from 'layouts/page'

const Updates = ({ updates }) => (
  <Page>
    <h2>Updates</h2>
    {updates.map(update => (
      <Link href={`/updates/${update.id}`} key={`update-${update.id}`}>
        <a>{update.meta.title}</a>
      </Link>
    ))}
  </Page>
)

Updates.protoTypes = {
  updates: PropTypes.array
}

Updates.defaultProps = {
  updates: []
}

Updates.getInitialProps = async () => {
  return {
    updates: [
      {
    ]
  }
}

export default Updates
